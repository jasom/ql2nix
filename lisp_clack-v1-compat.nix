
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack, 
   lisp_circular-streams, lisp_marshal, lisp_trivial-backtrace, lisp_http-body, lisp_dexador, lisp_usocket, lisp_prove, lisp_bordeaux-threads, lisp_lack,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_circular-streams lisp_marshal lisp_trivial-backtrace lisp_http-body lisp_dexador lisp_usocket lisp_prove lisp_bordeaux-threads lisp_lack  ];
      inherit stdenv;
      systemName = "clack-v1-compat";
      
      sourceProject = "${lisp-project_clack}";
      patches = [];
      lisp_dependencies = "${lisp_circular-streams} ${lisp_marshal} ${lisp_trivial-backtrace} ${lisp_http-body} ${lisp_dexador} ${lisp_usocket} ${lisp_prove} ${lisp_bordeaux-threads} ${lisp_lack}";
      name = "lisp_clack-v1-compat-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
