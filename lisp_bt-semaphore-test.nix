
{ buildLispPackage, stdenv, fetchurl, lisp-project_bt-semaphore, 
   lisp_bt-semaphore, lisp_clunit,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bt-semaphore lisp_clunit  ];
      inherit stdenv;
      systemName = "bt-semaphore-test";
      
      sourceProject = "${lisp-project_bt-semaphore}";
      patches = [];
      lisp_dependencies = "${lisp_bt-semaphore} ${lisp_clunit}";
      name = "lisp_bt-semaphore-test-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
