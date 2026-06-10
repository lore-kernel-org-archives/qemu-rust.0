Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CF2CD98CE
	for <qemu-rust@archiver.kernel.org>; Wed, 10 Jun 2026 18:51:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wXO1Y-00025a-3v; Wed, 10 Jun 2026 14:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXO1V-000254-Gz
 for qemu-rust@nongnu.org; Wed, 10 Jun 2026 14:51:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXO1T-0002N1-CV
 for qemu-rust@nongnu.org; Wed, 10 Jun 2026 14:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781117489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJizkvEeQr5W24xg9kyOBmTnK/HoAg1GDQLvaHCll9A=;
 b=WcDbsqFkQCBnDGPVixArdbWRzUbXcHskWeoQHbJBJ/3gCAmyIWJcCOnj5fnD88vznNXu84
 I5OienNnCmoVzk79ij8XXJis7q1gW5DwZuwTOFj5WKIGw15TkzdpTwxSA2Ju4MuO8H4ddY
 PfYCoofX3ETJ/cOu9JhDscFl+M9+vsI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-KB8GWbQrOuOZjYHnEcYZAw-1; Wed, 10 Jun 2026 14:51:27 -0400
X-MC-Unique: KB8GWbQrOuOZjYHnEcYZAw-1
X-Mimecast-MFC-AGG-ID: KB8GWbQrOuOZjYHnEcYZAw_1781117487
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8cea98a0effso131407956d6.2
 for <qemu-rust@nongnu.org>; Wed, 10 Jun 2026 11:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781117487; x=1781722287;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GJizkvEeQr5W24xg9kyOBmTnK/HoAg1GDQLvaHCll9A=;
 b=KFn+I4IArcJz2nQ0lCpgP84ONCmtDlMywrlpD5nt69iMAtiQIoucFdiCJ3hPwkq7oQ
 AplGmbrGLXEfoSeVJR2g8b6rmiRU8o0ZxByk0KV8m+8TzCPai/t66ct60OTCN/WxP1Km
 sxHVIDk7we8PmhcbD2obXEqTZug1PMKghox25ZM2rIEmw9L7S53F+QDqyXteb6WlUgRU
 ALTiDT9Qp7UZ3JaF67j17oCHPh++s+o+rsaZBMG6nB0noxV22ekDKi6desGxSEAVRR3w
 y6LwukSDrXQ3dgClylvZX8Zw+KWU0nNP6s8f/YruXjjdE2W4B+7sb3pVQGXuKTavrjET
 y0cA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/CdGw0zf1DCsO9V0Ij1fognshc/OtRhPgYAEp2Mf8/pNzmxGPlKAuPbBKAmYrhJN8gmb5QSqNLIBs=@nongnu.org
X-Gm-Message-State: AOJu0YzYiKK8LgXTLX+UNRq3jtXkGhpdgEJ0yStUuaLtfXoLYkvqpnDl
 FR8y0JNsAu+os/m1IhLykxVVI4IZdVdDyswtDHqV7c8du3bv1xTmZUNmsufOrPJig9aEdAM1dHY
 z680jJPniQ2FCutUzVhI0ys/vNURXP0tqi4koAaev6wir09mAC98ASWY=
X-Gm-Gg: Acq92OEk7yek9X8W5WcPlaIq+mKLuqMIDkX9dVPVvDNEuaMJaQsRlr6aZQmdvPoSZzr
 D/bvWRguvX5zsLuW9ZafP5tpyjh7EO5SR1p5neyt+t7seJgD+ruZWGhl67puiWhFpSvCJcIzSlx
 06StE2NeM25Es0xwpwbHWfBSNA38tH+bJEjJCVspweMHdXrW7CfJIUkhT4SGoRnK5I77a9wbrfY
 9O+GDgS91mnR5UCt0B0UUS/rAfbrxcgCWix+/1SUPwpKBG0k8jKsNioKz9aqrjOduR+7v/QDQOk
 a6SB2Oc624D2emKtRj+T3q/qwWcjyTHjS4HNrPQ2PdSTii1fvgIDQUbOFHAabE4nc1kxOZH/3Dr
 rIFNb1+IvpvWhgn7FSoX8M6ZDpA==
X-Received: by 2002:a05:6214:1d0d:b0:8ce:eaf7:dbe7 with SMTP id
 6a1803df08f44-8d18a00f4d9mr8732306d6.33.1781117486602; 
 Wed, 10 Jun 2026 11:51:26 -0700 (PDT)
X-Received: by 2002:a05:6214:1d0d:b0:8ce:eaf7:dbe7 with SMTP id
 6a1803df08f44-8d18a00f4d9mr8731826d6.33.1781117486102; 
 Wed, 10 Jun 2026 11:51:26 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8cecc8222bcsm246008466d6.0.2026.06.10.11.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 11:51:25 -0700 (PDT)
Date: Wed, 10 Jun 2026 14:51:23 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Fabiano Rosas <farosas@suse.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Sana Sharma <sansshar@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Juraj Marcin <jmarcin@redhat.com>, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: Re: [PATCH v2 10/10] migration: Switch to TYPE_OBJECT with object
 properties
Message-ID: <aimyK31EgOJICi_X@x1.local>
References: <20260609172514.2037645-1-peterx@redhat.com>
 <20260609172514.2037645-11-peterx@redhat.com>
 <aimRB5Uv2XtTE4Xy@redhat.com>
MIME-Version: 1.0
In-Reply-To: <aimRB5Uv2XtTE4Xy@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QbFqKPYS_qVUHhuUJXfVTE42FcCGcDuO4rKJkLQTSa4_1781117487
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Jun 10, 2026 at 05:29:59PM +0100, Daniel P. Berrangé wrote:
> -global is/was intended for devices, primarily those which
> are created by default as part of the machine. For dynamically
> created devices the docs recommend use of -device instead
> of -global.

I wished it was called -device-global then it'll be clearer, otherwise from
an API perspective it really shouldn't be limited to qdev..

It makes sense to not call it -device-global, IMHO essentially because we
don't necessarily need to restrict it to -device.

> 
> I get that -global was exposed for migration via the inappropriate
> use of TYPE_DEVICE as a parent for TYPE_MIGRATION, but I don't
> think we should be prolonging that misuse by exposing use of
> -global for things which are QOM rather than QDev.
> 
> If we want todo that for the sake of backcompat, IMHO it should
> be deprecated so it only lives for a short while after the
> conversion to QOM.
> 
> This makes me realize that this does not implement the UserCreatable
> interface on TYPE_MIGRATION, so I'm presuming the MigrationState is
> still created internally. Perhaps we should switch to making it a
> full UserCreatable, such that -object can be used to set all migration
> parameters on the command line and -global won't be required ? 

This is what Fabiano suggested in his reply here:

https://lore.kernel.org/qemu-devel/87jys75npb.fsf@suse.de/

I wonder what's your view on that when put together the singleton series I
used to post, where I also mentioned in the reply:

https://lore.kernel.org/qemu-devel/aimtYbka4GB9Qyk6@x1.local/

If you think that's the right approach, we can try to have it to replace
-global.  -global is debug API for migration, we don't need to obsolete it.
Compat property is, which is unaffected by this.  So we can remove -global
support for migration, but it'll always be good to have a replacement for
scripts.

Thanks,

-- 
Peter Xu


