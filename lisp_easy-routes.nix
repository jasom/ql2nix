
{ buildLispPackage, stdenv, fetchurl, lisp-project_easy-routes, 
   lisp_hunchentoot, lisp_routes,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hunchentoot lisp_routes  ];
      inherit stdenv;
      systemName = "easy-routes";
      
      sourceProject = "${lisp-project_easy-routes}";
      patches = [];
      lisp_dependencies = "${lisp_hunchentoot} ${lisp_routes}";
      name = "lisp_easy-routes-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
