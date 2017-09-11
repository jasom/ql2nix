
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mongo-id, 
   lisp_bordeaux-threads, lisp_local-time, lisp_md5,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_local-time lisp_md5  ];
      inherit stdenv;
      systemName = "cl-mongo-id";
      
      sourceProject = "${lisp-project_cl-mongo-id}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_local-time} ${lisp_md5}";
      name = "lisp_cl-mongo-id-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
