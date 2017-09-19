
{ buildLispPackage, stdenv, fetchurl, lisp-project_clss, 
   lisp_plump, lisp_array-utils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_plump lisp_array-utils  ];
      inherit stdenv;
      systemName = "clss";
      
      sourceProject = "${lisp-project_clss}";
      patches = [];
      lisp_dependencies = "${lisp_plump} ${lisp_array-utils}";
      name = "lisp_clss-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
