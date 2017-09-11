
{ buildLispPackage, stdenv, fetchurl, lisp-project_hunchentoot-cgi, 
   lisp_hunchentoot, lisp_puri,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hunchentoot lisp_puri  ];
      inherit stdenv;
      systemName = "hunchentoot-cgi";
      
      sourceProject = "${lisp-project_hunchentoot-cgi}";
      patches = [];
      lisp_dependencies = "${lisp_hunchentoot} ${lisp_puri}";
      name = "lisp_hunchentoot-cgi-20140211-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
