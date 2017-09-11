
{ buildLispPackage, stdenv, fetchurl, lisp-project_thread-comm-rendezvous, 
   lisp_cl-test-more, lisp_thread-comm-rendezvous,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-test-more lisp_thread-comm-rendezvous  ];
      inherit stdenv;
      systemName = "thread.comm.rendezvous.test";
      
      sourceProject = "${lisp-project_thread-comm-rendezvous}";
      patches = [];
      lisp_dependencies = "${lisp_cl-test-more} ${lisp_thread-comm-rendezvous}";
      name = "lisp_thread-comm-rendezvous-test-20121013-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
