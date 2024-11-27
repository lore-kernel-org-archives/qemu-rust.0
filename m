Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tGH14-000851-9U
	for mharc-qemu-rust@gnu.org; Wed, 27 Nov 2024 07:19:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tGH0Z-0007i8-Dz
 for qemu-rust@nongnu.org; Wed, 27 Nov 2024 07:19:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tGH0V-0000WK-Rg
 for qemu-rust@nongnu.org; Wed, 27 Nov 2024 07:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732709938;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JFo9gsAIMuKk4LMqiiNBj1csuD9JhLBNnUiinJlMyV4=;
 b=geC9CwwdnkK2tXThawoKEQVvWXMaRTdePZfC01RT8G1KpGEIoJBlGhEdcFhcLxj1Bouiph
 TU48C+3uFJJ5WYIb4DZ3ma4JbsxJUo+ODpXgyns+DQyDwGHkSScp5U5MiKkUhstSzJJ4DR
 4JOO4nChvxAbpCNpSNln3+laAX+0CQs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-mgH7ZpHcMIO7-axjBmN-9A-1; Wed,
 27 Nov 2024 07:18:55 -0500
X-MC-Unique: mgH7ZpHcMIO7-axjBmN-9A-1
X-Mimecast-MFC-AGG-ID: mgH7ZpHcMIO7-axjBmN-9A
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 478DF195FE12; Wed, 27 Nov 2024 12:18:54 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.25])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 819581956054; Wed, 27 Nov 2024 12:18:52 +0000 (UTC)
Date: Wed, 27 Nov 2024 12:18:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
Subject: Re: Rust in QEMU roadmap
Message-ID: <Z0cOKGl-46wg5NTG@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <cc40943e-dec1-4890-a1d9-579350ce296f@pbonzini.local>
 <CAJSP0QVGP9RQ57V-+2Lo2Se0x0O1KuENT24HzOn2X3A3vmn73A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJSP0QVGP9RQ57V-+2Lo2Se0x0O1KuENT24HzOn2X3A3vmn73A@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.931,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 27 Nov 2024 12:19:22 -0000

On Wed, Nov 27, 2024 at 05:47:19AM -0500, Stefan Hajnoczi wrote:
> On Tue, 26 Nov 2024 at 13:04, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > Tracing/logging
> > '''''''''''''''
> >
> > Tracepoints and logging are not supported yet, and no one has started working
> > on it.
> >
> > For tracing, it's not clear to me how much C code can be reused and how
> > much Rust code can be automatically generated.  This would be a valid
> > Outreachy or Summer of Code project, as it has a limited need for unsafe
> > code and a well-defined scope.
> >
> > A pure-Rust implementation would be interesting, but note that the usage
> > of printf-style %-based field formatting is pervasive in the tracing
> > subsystem.
> 
> The purpose of QEMU's tracing subsystem is to support cross-platform
> tracing. Instead of making QEMU code depend on a specific tracer (like
> DTrace or LTTng UST) that may not be available across platforms, the
> tracing subsystem generates tracer-specific C code for trace events at
> compile time. The most straightforward way to expose this to Rust is
> to add C functions that invoke each trace event and then call those C
> functions from Rust. Tracing is designed to be lightweight and this
> approach results in more overhead than in native C tracing though.
> 
> A pure Rust solution would be nice, but I'm not sure how to reconcile
> that with the purpose of the tracing subsystem, which is to support
> the various tracers native to QEMU's host platforms. They are geared
> towards C and use low-level techniques to generate low overhead
> tracing code.

I think a purer Rust solution looks not too difficult for many of
the backends.

 * dtrace

   Use this crate https://crates.io/crates/usdt to generate
   Rust code from the .d file we already generate

 * ftrace

   A mere write() to a pre-opened FD

 * log

   A call to the qemu_log function, which can be exposed to rust

 * simple

   A call to some funcs in trace/simple.h which can be exposed
   to rust

 * syslog

   A call to syslog(), can be done with https://crates.io/crates/syslog

 * ust

   Unclear how to do this at a quick glance, but likely
   has a solution

Most of these rely on the trace_event_get_state macro which is
where we try to take some fast paths. So the hardest bit is likely
figuring out a nice way to represent the 'state check' in Rust
without it always turning into a function call.

> That's what QEMU's tracing subsystem is today. But it's a low activity
> subsystem where things can be changed with less disruption to users
> than in most other subsystems. I think it would be nice to look at
> what native Rust tracing has to offer ad reconsider some of the
> requirements that shaped QEMU's C tracing subsystem. Maybe we can take
> a more modern approach.

IMHO a core requirement for this must be that we can seemlessly trace
across Rust and C code using the same mechanism.

With my developer hat on, 99% of the time I'm just using the 'log'
backend because it is soooooo simple, very effective for dev use
and we enable it by default.

With my distro hat on, we enable 'dtrace' because that gives us a
low-overhead probe facility for tracing production deployments,
AND crucially it gives us system-global tracing facility across
the kernel, QEMU and all other apps.

IOW, my POV is that support for the "log" and "dtrace" backends
is mandatory for the Rust layer as a minium viable baseline.


I question the usefulness of the 'syslog' trace target. I can't see
it being desirable as a option for 'production' builds, and it seems
uneccessarily indirect for developers. What's its compelling USP ?

WRT 'ftrace', IIUC, the Linux 'perf' command has built-in support
for using USDT probes now:

  https://www.brendangregg.com/perf.html#StaticUserTracing

Do we still have a compelling USP for the 'ftrace' backend, if we
can use 'perf' for this ?

WRT 'ust', in LTTng, I see reference to the ability to use USDT probes,
so I wonder if we still need a dedicated 'ust' backend around ?

Potentially we're down to three options 'log', 'simple', and 'dtrace'.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


