
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_bordeaux-threads, lisp_closer-mop, lisp_deeds, lisp_documentation-utils, lisp_form-fiddle, lisp_lambda-fiddle, lisp_trivial-garbage, lisp_trivial-indent, lisp_uuid, lisp_verbose,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_closer-mop lisp_deeds lisp_documentation-utils lisp_form-fiddle lisp_lambda-fiddle lisp_trivial-garbage lisp_trivial-indent lisp_uuid lisp_verbose  ];
      inherit stdenv;
      systemName = "maiden";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_closer-mop} ${lisp_deeds} ${lisp_documentation-utils} ${lisp_form-fiddle} ${lisp_lambda-fiddle} ${lisp_trivial-garbage} ${lisp_trivial-indent} ${lisp_uuid} ${lisp_verbose}";
      name = "lisp_maiden-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
