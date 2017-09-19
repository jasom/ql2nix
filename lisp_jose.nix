
{ buildLispPackage, stdenv, fetchurl, lisp-project_jose, 
   lisp_trivial-utf-8, lisp_assoc-utils, lisp_split-sequence, lisp_jonathan, lisp_ironclad, lisp_cl-base64,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-utf-8 lisp_assoc-utils lisp_split-sequence lisp_jonathan lisp_ironclad lisp_cl-base64  ];
      inherit stdenv;
      systemName = "jose";
      
      sourceProject = "${lisp-project_jose}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-utf-8} ${lisp_assoc-utils} ${lisp_split-sequence} ${lisp_jonathan} ${lisp_ironclad} ${lisp_cl-base64}";
      name = "lisp_jose-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
