
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cairo2, 
   lisp_cl-gtk2-cairo, lisp_cl-freetype2, lisp_metabang-bind, lisp_trivial-garbage, lisp_cl-utilities, lisp_cl-colors, lisp_cffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gtk2-cairo lisp_cl-freetype2 lisp_metabang-bind lisp_trivial-garbage lisp_cl-utilities lisp_cl-colors lisp_cffi  ];
      inherit stdenv;
      systemName = "cl-cairo2-gtk2";
      
      sourceProject = "${lisp-project_cl-cairo2}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gtk2-cairo} ${lisp_cl-freetype2} ${lisp_metabang-bind} ${lisp_trivial-garbage} ${lisp_cl-utilities} ${lisp_cl-colors} ${lisp_cffi}";
      name = "lisp_cl-cairo2-gtk2-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
