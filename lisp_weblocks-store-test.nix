
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks-stores, 
   lisp_f-underscore, lisp_lift, lisp_weblocks, lisp_weblocks-memory, lisp_weblocks-test, lisp_weblocks-prevalence,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_f-underscore lisp_lift lisp_weblocks lisp_weblocks-memory lisp_weblocks-test lisp_weblocks-prevalence  ];
      inherit stdenv;
      systemName = "weblocks-store-test";
      
      sourceProject = "${lisp-project_weblocks-stores}";
      patches = [];
      lisp_dependencies = "${lisp_f-underscore} ${lisp_lift} ${lisp_weblocks} ${lisp_weblocks-memory} ${lisp_weblocks-test} ${lisp_weblocks-prevalence}";
      name = "lisp_weblocks-store-test-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
