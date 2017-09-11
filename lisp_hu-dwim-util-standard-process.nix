
{ buildLispPackage, stdenv, fetchurl, lisp-project_hu-dwim-util, 
   lisp_hu-dwim-asdf, lisp_hu-dwim-delico, lisp_hu-dwim-logger,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_hu-dwim-delico lisp_hu-dwim-logger  ];
      inherit stdenv;
      systemName = "hu.dwim.util/standard-process";
      
      sourceProject = "${lisp-project_hu-dwim-util}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_hu-dwim-delico} ${lisp_hu-dwim-logger}";
      name = "lisp_hu-dwim-util-standard-process-20170630-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }