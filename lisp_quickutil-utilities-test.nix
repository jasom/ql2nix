
{ buildLispPackage, stdenv, fetchurl, lisp-project_quickutil, 
   lisp_quickutil-client, lisp_quickutil-server,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_quickutil-client lisp_quickutil-server  ];
      inherit stdenv;
      systemName = "quickutil-utilities-test";
      
      sourceProject = "${lisp-project_quickutil}";
      patches = [];
      lisp_dependencies = "${lisp_quickutil-client} ${lisp_quickutil-server}";
      name = "lisp_quickutil-utilities-test-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
