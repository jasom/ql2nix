
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-yesql, 
   lisp_overlord, lisp_esrap, lisp_serapeum, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_overlord lisp_esrap lisp_serapeum lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-yesql";
      
      sourceProject = "${lisp-project_cl-yesql}";
      patches = [];
      lisp_dependencies = "${lisp_overlord} ${lisp_esrap} ${lisp_serapeum} ${lisp_alexandria}";
      name = "lisp_cl-yesql-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
