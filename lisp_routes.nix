
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-routes, 
   lisp_iterate, lisp_puri, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_puri lisp_split-sequence  ];
      inherit stdenv;
      systemName = "routes";
      
      sourceProject = "${lisp-project_cl-routes}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_puri} ${lisp_split-sequence}";
      name = "lisp_routes-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
