
{ buildLispPackage, stdenv, fetchurl, lisp-project_glop, 
  mesa, xorg,   lisp_cffi, lisp_trivial-garbage, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_trivial-garbage lisp_split-sequence xorg.libX11 xorg.libXcomposite mesa xorg.libXrandr ];
      inherit stdenv;
      systemName = "glop";
      
      sourceProject = "${lisp-project_glop}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_trivial-garbage} ${lisp_split-sequence}";
      name = "lisp_glop-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
