
{ buildLispPackage, stdenv, fetchurl, lisp-project_lack, 
   lisp_split-sequence, lisp_cl-base64,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_cl-base64  ];
      inherit stdenv;
      systemName = "lack-middleware-auth-basic";
      
      sourceProject = "${lisp-project_lack}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_cl-base64}";
      name = "lisp_lack-middleware-auth-basic-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
