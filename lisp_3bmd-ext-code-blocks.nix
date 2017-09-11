
{ buildLispPackage, stdenv, fetchurl, lisp-project_3bmd, 
   lisp_3bmd, lisp_alexandria, lisp_colorize,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_3bmd lisp_alexandria lisp_colorize  ];
      inherit stdenv;
      systemName = "3bmd-ext-code-blocks";
      
      sourceProject = "${lisp-project_3bmd}";
      patches = [];
      lisp_dependencies = "${lisp_3bmd} ${lisp_alexandria} ${lisp_colorize}";
      name = "lisp_3bmd-ext-code-blocks-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
