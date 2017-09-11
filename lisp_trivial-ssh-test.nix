
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-ssh, 
   lisp_fiveam, lisp_trivial-ssh,  
  ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_trivial-ssh  ];
      inherit stdenv;
      systemName = "trivial-ssh-test";
      
      sourceProject = "${lisp-project_trivial-ssh}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_trivial-ssh}";
      name = "lisp_trivial-ssh-test-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" ];
    }
