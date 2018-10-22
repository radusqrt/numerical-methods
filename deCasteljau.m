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
## @deftypefn {Function File} {@var{retval} =} deCasteljau (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Stefan <stefan@Specter>
## Created: 2018-10-22

# Returns a point from the Bezier curve
function [result] = deCasteljau (v,i,j,t)
  if i == 0
    result = v(j + 1, :);
  else
    result = (1 - t) * deCasteljau(v,i - 1,j,t) + t * deCasteljau(v,i - 1, j + 1,t);   
  endif
endfunction