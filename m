Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D261E9B269
	for <qemu-rust@archiver.kernel.org>; Tue, 24 Feb 2026 14:07:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vut47-00066p-Ny; Tue, 24 Feb 2026 09:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1vut45-00065G-AY
 for qemu-rust@nongnu.org; Tue, 24 Feb 2026 09:07:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1vut43-0004Ss-SD
 for qemu-rust@nongnu.org; Tue, 24 Feb 2026 09:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771942023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WMG90nQw2aKOpn7s/SXrczV3b7uDI8IcAUu+zIU60o0=;
 b=bB+ghTOJCt3sZ7RFBs86k4MSqpP+iHCZJwQ4bNQpof9T0dCVxfmwO6o2IQqIuAR4h9aLhd
 Pbqtlfzv8cHnyv6Hnu05IZMBAnkByeHty6OIHzbN5CdLIrqJhPNZn+UG3WEp7OfcXDX5CX
 sX63fqyhgE8nOOOUCiJLTfD9RBZZzm4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-CLlUFe9WOxC0Y_6-3jF6jw-1; Tue,
 24 Feb 2026 09:06:59 -0500
X-MC-Unique: CLlUFe9WOxC0Y_6-3jF6jw-1
X-Mimecast-MFC-AGG-ID: CLlUFe9WOxC0Y_6-3jF6jw_1771942018
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 965FE1800639; Tue, 24 Feb 2026 14:06:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.13])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 545731955F43; Tue, 24 Feb 2026 14:06:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D767421E692D; Tue, 24 Feb 2026 15:06:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, qemu-rust@nongnu.org
Subject: Re: [PATCH v2 00/16] rust: QObject and QAPI bindings
In-Reply-To: <20260108131043.490084-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Thu, 8 Jan 2026 14:10:27 +0100")
References: <20260108131043.490084-1-pbonzini@redhat.com>
Date: Tue, 24 Feb 2026 15:06:55 +0100
Message-ID: <87tsv6z14w.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 3n_uS5MyYOax7z0iV2BYHyMFGHdh_PNUuU6WGL1585k_1771942018
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> This adds two related parts of the Rust bindings:

[...]

>  docs/devel/rust.rst                           |   1 +
>  meson.build                                   |   4 +-
>  include/qobject/qobject.h                     |   5 +-
>  rust/util/wrapper.h                           |   8 +
>  qapi/meson.build                              |   9 +
>  rust/Cargo.lock                               |   2 +
>  rust/Cargo.toml                               |   2 +
>  rust/meson.build                              |   4 +
>  rust/tests/meson.build                        |  21 +-
>  rust/tests/tests/integration.rs               |   2 +
>  rust/tests/tests/qapi.rs                      | 444 +++++++++++++
>  rust/util/Cargo.toml                          |   2 +
>  rust/util/meson.build                         |  30 +-
>  rust/util/src/lib.rs                          |   4 +
>  rust/util/src/qobject/deserialize.rs          | 134 ++++
>  rust/util/src/qobject/deserializer.rs         | 371 +++++++++++

Are you sure having two source filenames differ in just one character is
a good idea?

>  rust/util/src/qobject/error.rs                |  58 ++
>  rust/util/src/qobject/mod.rs                  | 383 ++++++++++++
>  rust/util/src/qobject/serialize.rs            |  59 ++
>  rust/util/src/qobject/serializer.rs           | 585 ++++++++++++++++++

Likewise.

These caused a bit of friction in review already...

[...]


