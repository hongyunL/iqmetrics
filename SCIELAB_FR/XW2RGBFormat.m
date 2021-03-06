function imRGB = XW2RGBFormat(imXW,row,col)
% Convert XW format data to RGB format
%
%    imRGB = XW2RGBFormat(imXW,row,col);
%
%   This  routine converts from XW format to RGB format.  The row and
%   column of the imXW are required input arguments.
%
%   We say matrices in (r,c,w) format are in RGB format.  The dimension, w,
%   represents the number of data color bands.  When w=3, the data are an RGB
%   image. But w can be almost anything (e.g., 31 wavelength samples from
%   400:10:700).  We use this format frequently for spectral data.
%
%   The RGB format is useful for imaging.  When w = 3, you can use
%   conventional image() routines.  When w > 3, use imageSPD.
%
%   The XW (space-wavelength) format is useful for computation.  In this
%   format, for example, XW*spectralFunction yields a spectral response.
%
%   The inverse routine is RGB2XWFormat.
%
%   Othertimes, we use a space-wavelength format.  In this format, which is
%   convenient for some matrix computations, the data are in a  (row*col) x
%   color format. We call this XW format.
%
%   The inverse routine is RGB2XWFormat
%
% See also: imageSPD, imagescRGB, imagescM, RGB2XWFormat
%
% Copyright ImagEval Consultants, LLC, 2003.

% 
if ieNotDefined('imXW'), error('No image data.'); end
if ndims(imXW) ~= 2,  error('XW2RGB:  input should be 2D'); end

if ieNotDefined('row'), error('No row size.'); end
if ieNotDefined('col'), error('No col size.'); end

x = size(imXW,1);
w = size(imXW,2);

if row*col ~= x, error('XW2RGBFormat:  Bad row, col values'); end

imRGB = reshape(imXW,row,col,w);

return;
