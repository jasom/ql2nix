
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-bunny, 
   lisp_trivial-backtrace, lisp_cl-events, lisp_eventfd, lisp_safe-queue, lisp_lparallel, lisp_quri, lisp_iolib, lisp_cl-amqp, lisp_string-case, lisp_alexandria,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-backtrace lisp_cl-events lisp_eventfd lisp_safe-queue lisp_lparallel lisp_quri lisp_iolib lisp_cl-amqp lisp_string-case lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-bunny.examples";
      
      sourceProject = "${lisp-project_cl-bunny}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-backtrace} ${lisp_cl-events} ${lisp_eventfd} ${lisp_safe-queue} ${lisp_lparallel} ${lisp_quri} ${lisp_iolib} ${lisp_cl-amqp} ${lisp_string-case} ${lisp_alexandria}";
      name = "lisp_cl-bunny-examples-0.4.5";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
