Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D81EFD209
	for <qemu-rust@archiver.kernel.org>; Wed, 25 Feb 2026 08:32:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vvAJr-0005uy-Kf; Wed, 25 Feb 2026 03:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1vvAJr-0005ue-04
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 03:32:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1vvAJj-0004ue-ID
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 03:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772008340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vUWCjVpDyEb31j/plPeG31w09E9+irjHP0hsKczQ1DE=;
 b=PCYHFO9cMr2J2xpom+iUpQdX6Gr+yljGqFtkxlWdsnSL3VMMElx1zJJiW8SD9PeMPHVnmU
 TLxQhRolCfkOWY3y1zB3D46fltxBHw+F+yIch4uKdmlMo6amWPt3xiW4BXs3sSs3CBsfrb
 atMPoj6pt4/4h6MGAGHnMzrt6aFj9lY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-59Zf58FJMYmWJmHhTza6gg-1; Wed,
 25 Feb 2026 03:32:16 -0500
X-MC-Unique: 59Zf58FJMYmWJmHhTza6gg-1
X-Mimecast-MFC-AGG-ID: 59Zf58FJMYmWJmHhTza6gg_1772008335
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8F8AB1800259; Wed, 25 Feb 2026 08:32:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.13])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4D8921800666; Wed, 25 Feb 2026 08:32:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0184221E692D; Wed, 25 Feb 2026 09:32:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, qemu-rust@nongnu.org
Subject: Re: [PATCH v2 11/16] scripts/qapi: pull c_name from camel_to_upper
 to caller
In-Reply-To: <20260108131043.490084-12-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Thu, 8 Jan 2026 14:10:38 +0100")
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <20260108131043.490084-12-pbonzini@redhat.com>
Date: Wed, 25 Feb 2026 09:32:12 +0100
Message-ID: <87wm01w7eb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: gyMsShvsreBzodKJ5VHZY5oUPCp8RPOqBdUZWkJEuwE_1772008335
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.358, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.659,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

Paolo Bonzini <pbonzini@redhat.com> writes:

> Allow using it for other languages too.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/qapi/common.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 14d5dd259c4..c75396a01b5 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -61,7 +61,7 @@ def camel_to_upper(value: str) -> str:
>          ret += ch
>          upc = ch.isupper()
>  
> -    return c_name(ret.upper()).lstrip('_')
> +    return ret.upper()
>  
>  
>  def c_enum_const(type_name: str,
> @@ -75,7 +75,7 @@ def c_enum_const(type_name: str,
>      :param prefix: Optional, prefix that overrides the type_name.
>      """
>      if prefix is None:
> -        prefix = camel_to_upper(type_name)
> +        prefix = c_name(camel_to_upper(type_name)).lstrip('_')
>      return prefix + '_' + c_name(const_name, False).upper()

No change in behavior, because this is the only use of camel_to_upper().

The move of c_name() out of camel_to_upper() is clearly wanted to make
it usable for other languages.

What about .lstrip('_')?  I wonder why we even have it.  Goes back all
the way to commit 6299659f544 (qapi script: code move for
generate_enum_name()) from 2014.  It seems to affect just
tests/qapi-schema/qapi-schema-test.json's

    { 'enum': '__org.qemu_x-Enum', 'data': [ '__org.qemu_x-value' ] }

This tests a downstream extension prefix __RFQDN_.

As is, we generate

    typedef enum __org_qemu_x_Enum {
        ORG_QEMU_X_ENUM___ORG_QEMU_X_VALUE,
        ORG_QEMU_X_ENUM__MAX,
    } __org_qemu_x_Enum;

Without the .lstrip('_'), we'd generate

    typedef enum __org_qemu_x_Enum {
        __ORG_QEMU_X_ENUM___ORG_QEMU_X_VALUE,
        __ORG_QEMU_X_ENUM__MAX,
    } __org_qemu_x_Enum;

Meh.

Turns out this isn't on purpose.  Back then, the loop to map camel to
upper worked differently, and produced unwanted leading '_'.  For
instance, it mapped 'AbraCadabra' to '_ABRA_CADABRA'.  The .lstrip()
made the function produce 'ABRA_CADABRA'.  It also makes it eat
downstream extensions' leading '__'.  Oopsie.

By moving it, we insulate Rust from this accident.  Okay.

We could delete it instead.  Might inconvenience downstreams.  Not a
demand; you may wish to keep this series focused on Rust.


