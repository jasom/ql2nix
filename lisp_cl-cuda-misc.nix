
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cuda, 
   lisp_cl-emb, lisp_local-time,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-emb lisp_local-time  ];
      inherit stdenv;
      systemName = "cl-cuda-misc";
      
      sourceProject = "${lisp-project_cl-cuda}";
      patches = [];
      lisp_dependencies = "${lisp_cl-emb} ${lisp_local-time}";
      name = "lisp_cl-cuda-misc-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
