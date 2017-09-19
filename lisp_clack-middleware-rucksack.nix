
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack, 
   lisp_rucksack, lisp_circular-streams, lisp_marshal, lisp_trivial-backtrace, lisp_http-body, lisp_dexador, lisp_usocket, lisp_prove, lisp_bordeaux-threads, lisp_lack,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_rucksack lisp_circular-streams lisp_marshal lisp_trivial-backtrace lisp_http-body lisp_dexador lisp_usocket lisp_prove lisp_bordeaux-threads lisp_lack  ];
      inherit stdenv;
      systemName = "clack-middleware-rucksack";
      
      sourceProject = "${lisp-project_clack}";
      patches = [];
      lisp_dependencies = "${lisp_rucksack} ${lisp_circular-streams} ${lisp_marshal} ${lisp_trivial-backtrace} ${lisp_http-body} ${lisp_dexador} ${lisp_usocket} ${lisp_prove} ${lisp_bordeaux-threads} ${lisp_lack}";
      name = "lisp_clack-middleware-rucksack-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
