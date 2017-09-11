
{ buildLispPackage, stdenv, fetchurl, lisp-project_yaclanapht, 
   lisp_defmacro-enhance, lisp_iterate,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_defmacro-enhance lisp_iterate  ];
      inherit stdenv;
      systemName = "yaclanapht";
      
      sourceProject = "${lisp-project_yaclanapht}";
      patches = [];
      lisp_dependencies = "${lisp_defmacro-enhance} ${lisp_iterate}";
      name = "lisp_yaclanapht-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
