
{ buildLispPackage, stdenv, fetchurl, lisp-project_bit-smasher, 
   lisp_cl-base64, lisp_cl-base58,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-base64 lisp_cl-base58  ];
      inherit stdenv;
      systemName = "bit-smasher";
      
      sourceProject = "${lisp-project_bit-smasher}";
      patches = [];
      lisp_dependencies = "${lisp_cl-base64} ${lisp_cl-base58}";
      name = "lisp_bit-smasher-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
