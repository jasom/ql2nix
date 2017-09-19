
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mongo-id, 
   lisp_local-time, lisp_md5, lisp_bordeaux-threads,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_md5 lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "cl-mongo-id";
      
      sourceProject = "${lisp-project_cl-mongo-id}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_md5} ${lisp_bordeaux-threads}";
      name = "lisp_cl-mongo-id-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
