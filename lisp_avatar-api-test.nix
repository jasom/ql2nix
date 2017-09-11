
{ buildLispPackage, stdenv, fetchurl, lisp-project_avatar-api, 
   lisp_avatar-api, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_avatar-api lisp_fiveam  ];
      inherit stdenv;
      systemName = "avatar-api-test";
      
      sourceProject = "${lisp-project_avatar-api}";
      patches = [];
      lisp_dependencies = "${lisp_avatar-api} ${lisp_fiveam}";
      name = "lisp_avatar-api-test-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
