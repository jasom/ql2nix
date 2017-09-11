
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack, 
   lisp_lack, lisp_lack-middleware-backtrace, lisp_bordeaux-threads,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lack lisp_lack-middleware-backtrace lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "clack";
      
      sourceProject = "${lisp-project_clack}";
      patches = [];
      lisp_dependencies = "${lisp_lack} ${lisp_lack-middleware-backtrace} ${lisp_bordeaux-threads}";
      name = "lisp_clack-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
