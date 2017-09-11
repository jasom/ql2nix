
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gendoc, 
   lisp_3bmd, lisp_3bmd-ext-code-blocks, lisp_cl-who,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_3bmd lisp_3bmd-ext-code-blocks lisp_cl-who  ];
      inherit stdenv;
      systemName = "cl-gendoc";
      
      sourceProject = "${lisp-project_cl-gendoc}";
      patches = [];
      lisp_dependencies = "${lisp_3bmd} ${lisp_3bmd-ext-code-blocks} ${lisp_cl-who}";
      name = "lisp_cl-gendoc-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
