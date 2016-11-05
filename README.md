# polaroid-thumbnail
This is a bash script to create a thumbnail of a photograph that looks like a Polaroid photo with the caption written underneath. The thumbnail is randomly rotated slightly and has a drop shadow, e.g.

![example thumbnail](https://github.com/scp93ch/polaroid-thumbnail/blob/master/example.png "example thumbnail")

The script requires the [ImageMagick suite](http://www.imagemagick.org/) to be installed. You use the script by supplying three arguments:

1. The input file name
2. The output file name
3. The caption (enclosed in quotes)

e.g. thumbnail.sh photo.jpg photo_thumb.png "This is the caption"

The input and output file types can be any format, but I recommend using PNG as the output format, because the drop shadow is actually alpha-blended to work with any background and PNG preserves the alpha channel.
