
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-nntp, 
   lisp_cl-ssl, lisp_usocket,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ssl lisp_usocket  ];
      inherit stdenv;
      systemName = "trivial-nntp";
      
      sourceProject = "${lisp-project_trivial-nntp}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ssl} ${lisp_usocket}";
      name = "lisp_trivial-nntp-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
