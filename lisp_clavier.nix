
{ buildLispPackage, stdenv, fetchurl, lisp-project_clavier, 
   lisp_chronicity, lisp_closer-mop, lisp_cl-ppcre, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_chronicity lisp_closer-mop lisp_cl-ppcre lisp_alexandria  ];
      inherit stdenv;
      systemName = "clavier";
      
      sourceProject = "${lisp-project_clavier}";
      patches = [];
      lisp_dependencies = "${lisp_chronicity} ${lisp_closer-mop} ${lisp_cl-ppcre} ${lisp_alexandria}";
      name = "lisp_clavier-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
