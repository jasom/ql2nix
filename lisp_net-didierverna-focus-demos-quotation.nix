
{ buildLispPackage, stdenv, fetchurl, lisp-project_focus, 
   lisp_net-didierverna-focus-flv,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_net-didierverna-focus-flv  ];
      inherit stdenv;
      systemName = "net.didierverna.focus.demos.quotation";
      
      sourceProject = "${lisp-project_focus}";
      patches = [];
      lisp_dependencies = "${lisp_net-didierverna-focus-flv}";
      name = "lisp_net-didierverna-focus-demos-quotation-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
