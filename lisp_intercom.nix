
{ buildLispPackage, stdenv, fetchurl, lisp-project_intercom, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_hunchentoot, lisp_jsown, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_hunchentoot lisp_jsown lisp_split-sequence  ];
      inherit stdenv;
      systemName = "intercom";
      
      sourceProject = "${lisp-project_intercom}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_hunchentoot} ${lisp_jsown} ${lisp_split-sequence}";
      name = "lisp_intercom-20130615-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
