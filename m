Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17104CD98EF
	for <qemu-rust@archiver.kernel.org>; Tue, 16 Jun 2026 21:03:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wZave-0000Qn-Vt; Tue, 16 Jun 2026 17:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wZavc-0000Q3-1k
 for qemu-rust@nongnu.org; Tue, 16 Jun 2026 17:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wZava-0001Ua-HS
 for qemu-rust@nongnu.org; Tue, 16 Jun 2026 17:02:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781643752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZrS83FVDh7XcjY93fZM/uw3X5ANblCtiBBhJb1FQR4=;
 b=SKOq7Rb4ooCkcBLEG0MeIccxmp2rkfXv+q/WK0GEDFfFMp/QbAIz4gmj/2oFm7q2ERSeuE
 OWwwnoqxNms3fD4oIeG60NiLkcyhaklU+qm8b72+NXikHmHkE+YVlcx5CEMqBQcPcya0Qu
 Hftk3LK0hEtZixURjZXtCIRaMPjtOXo=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-h9AvtQ-cNIWK1NmFO-zbYQ-1; Tue, 16 Jun 2026 17:02:31 -0400
X-MC-Unique: h9AvtQ-cNIWK1NmFO-zbYQ-1
X-Mimecast-MFC-AGG-ID: h9AvtQ-cNIWK1NmFO-zbYQ_1781643750
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-7fccd214113so21569687b3.3
 for <qemu-rust@nongnu.org>; Tue, 16 Jun 2026 14:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781643750; x=1782248550;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KZrS83FVDh7XcjY93fZM/uw3X5ANblCtiBBhJb1FQR4=;
 b=N0/qWakNEdCBOmFi6PutqUNv8BManug+eu91p6EgLchG8wGG5o7v8hrZj/dWKfqbef
 IH/weUPUR0dGkXxVRMo2S9gkmBOe4seP96thy9DqDZe9RlD0QYKGSBI0afPb7M6QKPoV
 LaSJSGxTSAkQRRwwJiBlv5XhQxzaCKUU7QDrxJJ3+yfQG0n5H/1xcr2yfCT6C29dGbRB
 hmMzPJHGL3DJlhAn0T4HJo7cWkEyfhiLq6yJxQEIGz/AFNNL6Nw7HqvaceMivjcZwwLs
 lwi7Xk9WpTdOzreJp8EP2MCfWTYAutqF1SJxnTFshwL0kv8f+IqMBpGGdMdr6NlsSwzu
 rJPQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8T6aQZDp+qUIxS9upNNTMEVCs9SawgFXdX7W7Kk3nv+fwNYxLQkpIVV/eQgFKNE3iItw5VtmyA5NU=@nongnu.org
X-Gm-Message-State: AOJu0Ywjh/lyhYz2Wg5pmxuYP9QGhqtAV0+cT28/mvMzdVundIWSV6l8
 QEkgGnKO3+7pWFUrs7M+P7lE7m48SxpPq8mvVtvmM3DenWm99u9ZBxfPJ0HKPgjtk+E5zw7VKZO
 TwkxfXuWIN97DLjMUaxVpK6D83mkcNNh+uPZFPT0T3R+q02mFPDAztqI=
X-Gm-Gg: AfdE7ckD7VkXUJNDQRQD+K1sPUb15s7EydcTzMoLlsR3fWM4kxRdeHVTCDdr+lFqbrI
 tCjE9Eia7MoOWUDWbeG+JPVuO7+h+f6qd88arIi677iyT+vtUreVdk2ohLkDbjQZJ95dqyrUMX5
 o9VrSkDOnwIDOHwxo/51RtnLt63lzz9CsRN9X7+gqkMACUKbpg6b1xO3jUf0k/7/WScB48nOE7W
 KKldvpH9O18RT6cfPDVuAE4IqGAdJdP2eIeB0PlQejpul7yQm5luv99fWwXzCO5DlDYJbvkwYv6
 HqMs0upKHqP09crVa4OyCYR3xI4gfMBlZPIalW0I8chokDv4LJghxrfyMu4TRf8kaP1jdsJG/jX
 ugM1qsPqI1kZtUk4=
X-Received: by 2002:a05:690c:62c2:b0:7f0:182:b5d1 with SMTP id
 00721157ae682-7fe5d3ade68mr8873917b3.12.1781643750141; 
 Tue, 16 Jun 2026 14:02:30 -0700 (PDT)
X-Received: by 2002:a05:690c:62c2:b0:7f0:182:b5d1 with SMTP id
 00721157ae682-7fe5d3ade68mr8872957b3.12.1781643749479; 
 Tue, 16 Jun 2026 14:02:29 -0700 (PDT)
Received: from x1.local ([142.188.212.74]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d9f5b8e73csm43683496d6.49.2026.06.16.14.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 14:02:28 -0700 (PDT)
Date: Tue, 16 Jun 2026 17:02:26 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
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
Subject: Re: [PATCH v2 05/10] qom: Create object-property-ptr.[ch]
Message-ID: <ajG54jNEs4JDBRJP@x1.local>
References: <20260609172514.2037645-1-peterx@redhat.com>
 <20260609172514.2037645-6-peterx@redhat.com>
 <aimNv51iMZ_yEgDG@redhat.com> <aimvTYDsv_-Xsboy@x1.local>
 <aiq9g60bOnvsOQOy@redhat.com> <87h5n94001.fsf@suse.de>
 <airI3UKeVVRUdQHq@redhat.com>
MIME-Version: 1.0
In-Reply-To: <airI3UKeVVRUdQHq@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HiwaQ19bLzxFR1HNpLoM1alGDJKt4FxJVa8-cFF6Orw_1781643750
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jun 11, 2026 at 03:40:29PM +0100, Daniel P. Berrangé wrote:
> There's nothing standard in QOM, but in patch 10 in this series
> Peter has a DEFINE_TLS_PROP_HELPERS() which macro-ized the
> repetitive getters/setters for the TLS string properties. The
> duplicate code still exists in the binary of course, just hidden
> from the source.

I believe we have the standard, which is qdev-properties.. which is (1)
class properties, (2) allow variable bindings so no setter/getter needed,
remembering them with pointer offsets.

It goes back to last version where the question becomes: whether we want to
make qdev-properties to be official QOM API, by removing qdev specific
changes and move them over to qom/.  Then make qdev only add its special
things on top.

Said that, considering if we want to make all things qom-set-able to
migration in the future, another option is directly go with getter/setter
that will do the property checks one by one. One benefit of that is we can
then get rid of migrate_params_check() and migrate_caps_check() altogether.

Maybe I should go with the latter, and forget qdev?

Thanks,

-- 
Peter Xu


