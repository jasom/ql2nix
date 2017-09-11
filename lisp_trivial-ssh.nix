
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-ssh, 
   lisp_trivial-ssh-libssh2,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-ssh-libssh2  ];
      inherit stdenv;
      systemName = "trivial-ssh";
      
      sourceProject = "${lisp-project_trivial-ssh}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-ssh-libssh2}";
      name = "lisp_trivial-ssh-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
