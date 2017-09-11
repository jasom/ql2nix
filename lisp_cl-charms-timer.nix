
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-charms, 
  ncurses,   lisp_cffi-grovel,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi-grovel ncurses ];
      inherit stdenv;
      systemName = "cl-charms-timer";
      
      sourceProject = "${lisp-project_cl-charms}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-grovel}";
      name = "lisp_cl-charms-timer-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
