import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/videos/widgets/video_button.dart';
import 'package:tictok_clone/features/videos/widgets/video_comments.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final VoidCallback onVideoEnded;
  final int index;

  const VideoPost({super.key, required this.onVideoEnded, required this.index});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/videos/video.mp4');

  bool _isPaused = false;

  final Duration _duration = const Duration(milliseconds: 200);

  late final AnimationController _animationController;

  void _onVideoChange() {
    final isVideoEnded = _videoPlayerController.value.isInitialized &&
        _videoPlayerController.value.position ==
            _videoPlayerController.value.duration;

    if (isVideoEnded) {
      widget.onVideoEnded();
    }
  }

  void _initializeVideoPlayer() async {
    await _videoPlayerController.initialize();

    _videoPlayerController.addListener(_onVideoChange);
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) return;

    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }

    if (info.visibleFraction == 0 && _videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }

    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onCommentsTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const VideoComments(),
    );
    _onTogglePause();
  }

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();

    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _duration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('video_post_${widget.index}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
              child: _videoPlayerController.value.isInitialized
                  ? VideoPlayer(_videoPlayerController)
                  : Container(color: Colors.black)),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) => Transform.scale(
                      scale: _animationController.value, child: child),
                  child: AnimatedOpacity(
                    opacity: _isPaused ? 1.0 : 0.0,
                    duration: _duration,
                    child: FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "@니꼬",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                Text(
                  "This is my house in Thailand!!!",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/3612017",
                  ),
                  child: Text("니꼬"),
                ),
                Gaps.v24,
                VideoButton(
                  icon: FontAwesomeIcons.solidHeart,
                  text: "2.9M",
                ),
                Gaps.v24,
                GestureDetector(
                  onTap: () => _onCommentsTap(context),
                  child: VideoButton(
                    icon: FontAwesomeIcons.solidComment,
                    text: "33K",
                  ),
                ),
                Gaps.v24,
                VideoButton(
                  icon: FontAwesomeIcons.share,
                  text: "Share",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
