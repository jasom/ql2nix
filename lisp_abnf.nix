
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-abnf, 
   lisp_cl-ppcre, lisp_esrap,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_esrap  ];
      inherit stdenv;
      systemName = "abnf";
      
      sourceProject = "${lisp-project_cl-abnf}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_esrap}";
      name = "lisp_abnf-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
