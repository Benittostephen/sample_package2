/*
library speed_gauge;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedGauge extends StatefulWidget {
  final int speed;
  final String label;
  final double minValue;
  final double maxValue;
  final Color speedColor;

  const SpeedGauge({
    super.key,
    required this.speed,
    required this.label,
    this.minValue = 0,
    this.maxValue = 11,
    required this.speedColor,
  });

  @override
  _SpeedGaugeState createState() => _SpeedGaugeState();
}

class _SpeedGaugeState extends State<SpeedGauge>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween(
      begin: widget.minValue,
      end: (widget.speed / 1024).clamp(widget.minValue, widget.maxValue),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant SpeedGauge oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.speed != widget.speed) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: (widget.speed / 1024).clamp(widget.minValue, widget.maxValue),
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ));
      _controller.forward(from: 0.0);
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Important: Call super.build to keep alive.
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SfRadialGauge(
          animationDuration: 3000, // Initial loading animation duration
          enableLoadingAnimation: true, // Enable initial loading animation
          axes: [
            RadialAxis(
              minimum: widget.minValue,
              maximum: widget.maxValue,
              ranges: [
                GaugeRange(
                  startValue: widget.minValue,
                  endValue: _animation.value,
                  color: widget.speedColor,
                ),
              ],
              pointers: [
                NeedlePointer(
                  needleColor: Colors.red,
                  value: _animation.value,
                  enableAnimation: true,
                  animationType: AnimationType.easeOutBack,
                  animationDuration: 2000,
                  needleEndWidth: 4,
                  needleStartWidth: 1,
                  tailStyle: const TailStyle(color: Colors.red),
                ),
              ],
              axisLineStyle: AxisLineStyle(
                  thickness: 10,
                  thicknessUnit: GaugeSizeUnit.logicalPixel,
                  cornerStyle: CornerStyle.endCurve,
                  color: Colors.grey.shade300),
              majorTickStyle: const MajorTickStyle(
                length: 10,
                thickness: 2,
                color: Colors.black,
              ),
              minorTickStyle: const MinorTickStyle(
                length: 5,
                thickness: 1.5,
                color: Colors.red,
              ),
              axisLabelStyle: const GaugeTextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
              annotations: [
                GaugeAnnotation(
                  widget: Text(
                    formatSpeed(widget.speed),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  angle: 90,
                  positionFactor: 1,
                ),
                GaugeAnnotation(
                  widget: Text(
                    widget.label,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  angle: 90,
                  positionFactor: 0.7,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

String formatSpeed(int speed) {
  if (speed >= 1024 * 1024) {
    return '${(speed / (1024 * 1024)).toStringAsFixed(2)} GB/s';
  } else if (speed >= 1024) {
    return '${(speed / 1024).toStringAsFixed(2)} MB/s';
  } else {
    return '${speed.toStringAsFixed(2)} KB/s';
  }
}
*/
