
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-serializer, 
   lisp_hu-dwim-util-mop, lisp_hu-dwim-util, lisp_hu-dwim-syntax-sugar, lisp_hu-dwim-def, lisp_hu-dwim-common, lisp_babel, lisp_hu-dwim-asdf,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-util-mop lisp_hu-dwim-util lisp_hu-dwim-syntax-sugar lisp_hu-dwim-def lisp_hu-dwim-common lisp_babel lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "hu.dwim.serializer";
      
      sourceProject = "${lisp-project_hu-dwim-serializer}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-util-mop} ${lisp_hu-dwim-util} ${lisp_hu-dwim-syntax-sugar} ${lisp_hu-dwim-def} ${lisp_hu-dwim-common} ${lisp_babel} ${lisp_hu-dwim-asdf}";
      name = "lisp_hu-dwim-serializer-20161204-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
