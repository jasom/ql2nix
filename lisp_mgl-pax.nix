
{ buildLispPackage, stdenv, fetchurl, lisp-project_mgl-pax, 
   lisp_swank, lisp_pythonic-string-reader, lisp_named-readtables, lisp_ironclad, lisp_cl-fad, lisp_babel, lisp_3bmd-ext-code-blocks, lisp_3bmd,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_swank lisp_pythonic-string-reader lisp_named-readtables lisp_ironclad lisp_cl-fad lisp_babel lisp_3bmd-ext-code-blocks lisp_3bmd  ];
      inherit stdenv;
      systemName = "mgl-pax";
      
      sourceProject = "${lisp-project_mgl-pax}";
      patches = [];
      lisp_dependencies = "${lisp_swank} ${lisp_pythonic-string-reader} ${lisp_named-readtables} ${lisp_ironclad} ${lisp_cl-fad} ${lisp_babel} ${lisp_3bmd-ext-code-blocks} ${lisp_3bmd}";
      name = "lisp_mgl-pax-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
