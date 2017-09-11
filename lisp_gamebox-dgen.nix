
{ buildLispPackage, stdenv, fetchurl, lisp-project_gamebox-dgen, 
   lisp_alexandria, lisp_cl-speedy-queue, lisp_genie, lisp_graph, lisp_simple-logger,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-speedy-queue lisp_genie lisp_graph lisp_simple-logger  ];
      inherit stdenv;
      systemName = "gamebox-dgen";
      
      sourceProject = "${lisp-project_gamebox-dgen}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-speedy-queue} ${lisp_genie} ${lisp_graph} ${lisp_simple-logger}";
      name = "lisp_gamebox-dgen-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
