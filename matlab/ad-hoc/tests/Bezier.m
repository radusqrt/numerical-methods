## Copyright (C) 2018 Stefan
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} Bezier.py (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Stefan <stefan@Specter>
## Created: 2018-10-22

function [] = Bezier(v, dim)
  # result is a dim x 2 matrix
  # result[i,1] - the x-coordinate
  # result[i,2] - the y- coordinate 
  result = zeros(dim, 2);
  i = 1;
  # calculate the points from the Bezier curve with deCasteljau
  # dim - the number of points from the Bezier curve
  for u = linspace(0,1,dim) 
    result(i,:) = deCasteljau(v, length(v) - 1, 0, u);
    i++;
  endfor
 
 #  plot the initials points and the Bezier Curve
 plot (result(1:dim,1), result(1:dim,2), 'r','LineWidth',2)
 hold
 plot(v(:,1), v(:,2),'LineWidth',2)
 title('Bezier Curve for given points')
endfunction