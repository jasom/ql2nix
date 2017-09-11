
{ buildLispPackage, stdenv, fetchurl, lisp-project_thread-comm-rendezvous, 
   lisp_bordeaux-threads, lisp_cl-annot,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cl-annot  ];
      inherit stdenv;
      systemName = "thread.comm.rendezvous";
      
      sourceProject = "${lisp-project_thread-comm-rendezvous}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cl-annot}";
      name = "lisp_thread-comm-rendezvous-20121013-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
