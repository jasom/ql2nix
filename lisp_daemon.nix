
{ buildLispPackage, stdenv, fetchurl, lisp-project_daemon, 
   lisp_trivial-features,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-features  ];
      inherit stdenv;
      systemName = "daemon";
      
      sourceProject = "${lisp-project_daemon}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-features}";
      name = "lisp_daemon-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
