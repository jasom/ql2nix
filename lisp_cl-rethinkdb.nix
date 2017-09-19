
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rethinkdb, 
   lisp_cl-hash-util, lisp_cl-base64, lisp_jonathan, lisp_cl-async, lisp_event-glue, lisp_local-time, lisp_blackbird,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-hash-util lisp_cl-base64 lisp_jonathan lisp_cl-async lisp_event-glue lisp_local-time lisp_blackbird  ];
      inherit stdenv;
      systemName = "cl-rethinkdb";
      
      sourceProject = "${lisp-project_cl-rethinkdb}";
      patches = [];
      lisp_dependencies = "${lisp_cl-hash-util} ${lisp_cl-base64} ${lisp_jonathan} ${lisp_cl-async} ${lisp_event-glue} ${lisp_local-time} ${lisp_blackbird}";
      name = "lisp_cl-rethinkdb-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
