
{ buildLispPackage, stdenv, fetchurl, lisp-project_north, 
   lisp_documentation-utils, lisp_cl-ppcre, lisp_crypto-shortcuts, lisp_uuid,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_cl-ppcre lisp_crypto-shortcuts lisp_uuid  ];
      inherit stdenv;
      systemName = "north-core";
      
      sourceProject = "${lisp-project_north}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_cl-ppcre} ${lisp_crypto-shortcuts} ${lisp_uuid}";
      name = "lisp_north-core-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
