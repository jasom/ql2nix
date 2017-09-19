
{ buildLispPackage, stdenv, fetchurl, lisp-project_gamebox-dgen, 
   lisp_genie, lisp_cl-speedy-queue, lisp_graph, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_genie lisp_cl-speedy-queue lisp_graph lisp_alexandria  ];
      inherit stdenv;
      systemName = "gamebox-dgen";
      
      sourceProject = "${lisp-project_gamebox-dgen}";
      patches = [];
      lisp_dependencies = "${lisp_genie} ${lisp_cl-speedy-queue} ${lisp_graph} ${lisp_alexandria}";
      name = "lisp_gamebox-dgen-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
