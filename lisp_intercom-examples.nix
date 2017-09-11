
{ buildLispPackage, stdenv, fetchurl, lisp-project_intercom, 
   lisp_intercom, lisp_jsown,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_intercom lisp_jsown  ];
      inherit stdenv;
      systemName = "intercom-examples";
      
      sourceProject = "${lisp-project_intercom}";
      patches = [];
      lisp_dependencies = "${lisp_intercom} ${lisp_jsown}";
      name = "lisp_intercom-examples-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
